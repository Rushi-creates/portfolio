<script>
  let activeTab = "about";

  function setActiveTab(tab) {
    activeTab = tab;
  }

  function handleTabKeydown(event, tab) {
    if (event.key === "Enter" || event.key === " ") {
      setActiveTab(tab);
    }
  }
</script>

<style>
  .tab {
    display: inline-block;
    padding: 10px;
    padding-right: 40px;

    cursor: pointer;
    color: #49288E;
    align-items: end;
    font-family: "Arial", sans-serif;
    font-size: 22px; /* Adjust the font size as desired */

  }

  .active {
    font-weight: bold;
  }
  .header {
    background-color: transparent;
    /* padding: 10px; */
    padding-right: 70px;
    /* padding-top: 40px; */
    /* padding-bottom: 20px; */
    display: flex;
    height: 15vh;
    align-items: center;
    justify-content: flex-end;

  }
</style>

<div class="header">
  <div
    class="tab {activeTab === 'about' ? 'active' : ''}"
    on:click={() => setActiveTab('about')}
    on:keydown={(event) => handleTabKeydown(event, 'about')}
    tabindex="-1"
  >
    About
  </div>
  <div
    class="tab {activeTab === 'projects' ? 'active' : ''}"
    on:click={() => setActiveTab('projects')}
    on:keydown={(event) => handleTabKeydown(event, 'projects')}
    tabindex="-1"
  >
    Projects
  </div>
  <div
    class="tab {activeTab === 'education' ? 'active' : ''}"
    on:click={() => setActiveTab('education')}
    on:keydown={(event) => handleTabKeydown(event, 'education')}
    tabindex="-1"
  >
    Education
  </div>
  <div
    class="tab {activeTab === 'contact' ? 'active' : ''}"
    on:click={() => setActiveTab('contact')}
    on:keydown={(event) => handleTabKeydown(event, 'contact')}
    tabindex="-1"
  >
    Contact
  </div>
</div>

