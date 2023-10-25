using System;
using System.Collections;
using UnityEngine;
using UnityEngine.AI;

// Token: 0x02000018 RID: 24
public class EnemyAIScript : MonoBehaviour
{
	// Token: 0x0600005E RID: 94 RVA: 0x00003287 File Offset: 0x00001487
	private void Awake()
	{
		this._as = base.GetComponent<AudioSource>();
	}

	// Token: 0x0600005F RID: 95 RVA: 0x00003295 File Offset: 0x00001495
	private void Start()
	{
		this.agent = base.GetComponent<NavMeshAgent>();
		this.RandomVoiceLine();
	}

	// Token: 0x06000060 RID: 96 RVA: 0x000032A9 File Offset: 0x000014A9
	private void Update()
	{
		this.agent.SetDestination(this.Player.transform.position);
	}

	// Token: 0x06000061 RID: 97 RVA: 0x000032C8 File Offset: 0x000014C8
	private void RandomVoiceLine()
	{
		this._as.clip = this.audioClipArray[UnityEngine.Random.Range(0, this.audioClipArray.Length)];
		this._as.PlayOneShot(this._as.clip);
		base.StartCoroutine("VoiceTimer");
	}

	// Token: 0x06000062 RID: 98 RVA: 0x00003317 File Offset: 0x00001517
	private IEnumerator VoiceTimer()
	{
		yield return new WaitForSeconds(45f);
		this.RandomVoiceLine();
		yield break;
	}

	// Token: 0x04000061 RID: 97
	public GameObject Player;

	// Token: 0x04000062 RID: 98
	private NavMeshAgent agent;

	// Token: 0x04000063 RID: 99
	public AudioSource _as;

	// Token: 0x04000064 RID: 100
	public AudioClip[] audioClipArray;
}
